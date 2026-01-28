'use client';

import { useSearchParams, useRouter } from 'next/navigation';
import { useState } from 'react';
import { loadStripe } from '@stripe/js';

export default function Checkout() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const tier = searchParams.get('tier') || 'starter';
  const price = searchParams.get('price') || '1250';

  const handleCheckout = async () => {
    setLoading(true);
    setError('');

    try {
      const response = await fetch('/api/checkout', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          tier,
          price: parseInt(price),
        }),
      });

      const data = await response.json();

      if (!data.sessionId) {
        throw new Error(data.error || 'Failed to create checkout session');
      }

      const stripe = await loadStripe(process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY!);
      if (!stripe) throw new Error('Stripe failed to load');

      await stripe.redirectToCheckout({ sessionId: data.sessionId });
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred');
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-900 to-slate-800 text-white py-20 px-4">
      <div className="max-w-2xl mx-auto">
        <div className="bg-slate-700 rounded-lg p-8">
          <h1 className="text-4xl font-bold mb-8">Order Summary</h1>

          <div className="bg-slate-600 rounded-lg p-6 mb-8">
            <div className="flex justify-between items-center mb-4">
              <span className="text-xl">Plan:</span>
              <span className="text-2xl font-bold capitalize">{tier}</span>
            </div>
            <div className="flex justify-between items-center border-t border-slate-500 pt-4">
              <span className="text-xl">Total:</span>
              <span className="text-3xl font-bold">€{parseInt(price).toLocaleString()}</span>
            </div>
          </div>

          {error && (
            <div className="bg-red-600 text-white p-4 rounded-lg mb-6">
              {error}
            </div>
          )}

          <button
            onClick={handleCheckout}
            disabled={loading}
            className="w-full bg-blue-600 hover:bg-blue-700 disabled:bg-slate-500 text-white font-bold py-3 px-4 rounded-lg transition mb-4"
          >
            {loading ? 'Processing...' : 'Proceed to Payment'}
          </button>

          <button
            onClick={() => router.back()}
            className="w-full bg-slate-600 hover:bg-slate-500 text-white font-bold py-3 px-4 rounded-lg transition"
          >
            Back
          </button>
        </div>
      </div>
    </div>
  );
}
