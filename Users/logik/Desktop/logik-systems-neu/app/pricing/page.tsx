'use client';

import { useState } from 'react';
import Link from 'next/link';

const PRICING_TIERS = [
  {
    name: 'Starter',
    price: 1250,
    description: 'Perfect for getting started',
    features: [
      'API Flutter Lock Access',
      'Basic Compliance Reports',
      'Email Support',
      'Monthly Updates',
      'Community Access'
    ],
    cta: 'Get Started',
    popular: false
  },
  {
    name: 'Professional',
    price: 4800,
    description: 'For growing businesses',
    features: [
      'Everything in Starter',
      'Advanced Compliance Reports',
      'Priority Email Support',
      'Weekly Updates',
      'Dedicated Account Manager',
      'Custom Integrations',
      'API Rate Limit: 10k/month'
    ],
    cta: 'Start Free Trial',
    popular: true
  },
  {
    name: 'Enterprise',
    price: 12500,
    description: 'For large organizations',
    features: [
      'Everything in Professional',
      'Custom Compliance Solutions',
      '24/7 Phone Support',
      'Real-time Updates',
      'Dedicated Support Team',
      'Custom Development',
      'Unlimited API Calls',
      'SLA Guarantee'
    ],
    cta: 'Contact Sales',
    popular: false
  }
];

export default function Pricing() {
  const [billingCycle, setBillingCycle] = useState<'monthly' | 'yearly'>('monthly');

  const getPrice = (basePrice: number) => {
    if (billingCycle === 'yearly') {
      return Math.floor(basePrice * 12 * 0.9);
    }
    return basePrice;
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-900 to-slate-800 text-white py-20 px-4">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="text-5xl font-bold mb-4">Simple, Transparent Pricing</h1>
          <p className="text-xl text-slate-300 mb-8">
            Choose the perfect plan for your compliance needs
          </p>

          <div className="flex justify-center items-center gap-4 mb-12">
            <button
              onClick={() => setBillingCycle('monthly')}
              className={`px-6 py-2 rounded-lg font-semibold transition ${
                billingCycle === 'monthly'
                  ? 'bg-blue-600 text-white'
                  : 'bg-slate-700 text-slate-300 hover:bg-slate-600'
              }`}
            >
              Monthly
            </button>
            <button
              onClick={() => setBillingCycle('yearly')}
              className={`px-6 py-2 rounded-lg font-semibold transition ${
                billingCycle === 'yearly'
                  ? 'bg-blue-600 text-white'
                  : 'bg-slate-700 text-slate-300 hover:bg-slate-600'
              }`}
            >
              Yearly (Save 10%)
            </button>
          </div>
        </div>

        <div className="grid md:grid-cols-3 gap-8 mb-16">
          {PRICING_TIERS.map((tier, index) => (
            <div
              key={index}
              className={`rounded-lg p-8 transition transform hover:scale-105 ${
                tier.popular
                  ? 'bg-gradient-to-b from-blue-600 to-blue-700 ring-2 ring-blue-400 scale-105'
                  : 'bg-slate-700 hover:bg-slate-600'
              }`}
            >
              {tier.popular && (
                <div className="mb-4 inline-block bg-blue-400 text-blue-900 px-3 py-1 rounded-full text-sm font-bold">
                  Most Popular
                </div>
              )}

              <h3 className="text-2xl font-bold mb-2">{tier.name}</h3>
              <p className="text-slate-300 mb-6">{tier.description}</p>

              <div className="mb-6">
                <span className="text-5xl font-bold">€{getPrice(tier.price).toLocaleString()}</span>
                <span className="text-slate-300 ml-2">
                  {billingCycle === 'monthly' ? '/month' : '/year'}
                </span>
              </div>

              <Link
                href={`/checkout?tier=${tier.name.toLowerCase()}&price=${getPrice(tier.price)}`}
                className={`block w-full py-3 px-4 rounded-lg font-bold text-center transition mb-8 ${
                  tier.popular
                    ? 'bg-white text-blue-600 hover:bg-slate-100'
                    : 'bg-blue-600 text-white hover:bg-blue-700'
                }`}
              >
                {tier.cta}
              </Link>

              <ul className="space-y-3">
                {tier.features.map((feature, featureIndex) => (
                  <li key={featureIndex} className="flex items-start gap-3">
                    <span className="text-green-400 mt-1">✓</span>
                    <span className="text-slate-200">{feature}</span>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        <div className="max-w-3xl mx-auto">
          <h2 className="text-3xl font-bold mb-8 text-center">Frequently Asked Questions</h2>
          <div className="space-y-6">
            {[
              {
                q: 'Can I change my plan anytime?',
                a: 'Yes, you can upgrade or downgrade your plan at any time. Changes take effect immediately.'
              },
              {
                q: 'Do you offer refunds?',
                a: 'We offer a 30-day money-back guarantee if you are not satisfied with our service.'
              },
              {
                q: 'What payment methods do you accept?',
                a: 'We accept all major credit cards, bank transfers, and digital payment methods via Stripe.'
              },
              {
                q: 'Is there a free trial?',
                a: 'Yes, Professional and Enterprise plans include a 14-day free trial. No credit card required.'
              }
            ].map((faq, index) => (
              <div key={index} className="bg-slate-700 rounded-lg p-6">
                <h3 className="text-lg font-bold mb-2">{faq.q}</h3>
                <p className="text-slate-300">{faq.a}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
