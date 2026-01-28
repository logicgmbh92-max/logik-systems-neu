'use client';

import { useSearchParams } from 'next/navigation';
import Link from 'next/link';

export default function Success() {
  const searchParams = useSearchParams();
  const sessionId = searchParams.get('session_id');

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-900 to-slate-800 text-white py-20 px-4">
      <div className="max-w-2xl mx-auto text-center">
        <div className="bg-green-600 rounded-full w-20 h-20 flex items-center justify-center mx-auto mb-8">
          <span className="text-4xl">✓</span>
        </div>

        <h1 className="text-4xl font-bold mb-4">Payment Successful!</h1>
        <p className="text-xl text-slate-300 mb-8">
          Thank you for your subscription. Your account is now active.
        </p>

        {sessionId && (
          <p className="text-sm text-slate-400 mb-8">
            Session ID: {sessionId}
          </p>
        )}

        <div className="space-y-4">
          <p className="text-slate-300">
            You should receive a confirmation email shortly with your login credentials and next steps.
          </p>

          <Link
            href="/"
            className="inline-block bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-8 rounded-lg transition"
          >
            Back to Home
          </Link>
        </div>
      </div>
    </div>
  );
}
