{{-- Inline SVG brand icon for saved card tiles. Usage: @include('partes.card-brand-svg', ['tipo' => 'visa']) --}}
@php $t = $tipo ?? 'default'; @endphp
@if($t === 'visa')
  <svg viewBox="0 0 48 48" fill="none" aria-label="Visa">
    <text x="2" y="34" font-family="Arial Black,Arial,sans-serif" font-size="22" font-weight="900" fill="white" letter-spacing="1">VISA</text>
  </svg>
@elseif($t === 'mastercard')
  <svg viewBox="0 0 48 48" fill="none" aria-label="Mastercard">
    <circle cx="16" cy="24" r="13" fill="#eb001b" opacity=".9"/>
    <circle cx="32" cy="24" r="13" fill="#f79e1b" opacity=".9"/>
    <path d="M24 13.3a13 13 0 0 1 0 21.4A13 13 0 0 1 24 13.3z" fill="#ff5f00" opacity=".9"/>
  </svg>
@elseif($t === 'amex')
  <svg viewBox="0 0 48 48" fill="none" aria-label="American Express">
    <text x="0" y="32" font-family="Arial Black,Arial,sans-serif" font-size="16" font-weight="900" fill="white" letter-spacing="0.5">AMEX</text>
  </svg>
@elseif($t === 'naranja')
  <svg viewBox="0 0 48 48" fill="none" aria-label="Naranja X">
    <circle cx="24" cy="24" r="18" fill="#f05a00" opacity=".7"/>
    <text x="24" y="29" font-family="Arial,sans-serif" font-size="9" font-weight="700" fill="white" text-anchor="middle">NARANJA</text>
  </svg>
@elseif($t === 'cabal')
  <svg viewBox="0 0 48 48" fill="none" aria-label="Cabal">
    <text x="0" y="32" font-family="Arial Black,Arial,sans-serif" font-size="18" font-weight="900" fill="white" letter-spacing="0.5">CABAL</text>
  </svg>
@elseif($t === 'argencard')
  <svg viewBox="0 0 48 48" fill="none" aria-label="Argencard">
    <text x="0" y="32" font-family="Arial Black,Arial,sans-serif" font-size="12" font-weight="900" fill="white">ARGENCARD</text>
  </svg>
@else
  <svg viewBox="0 0 48 48" fill="none" aria-label="Tarjeta">
    <circle cx="18" cy="24" r="14" fill="rgba(255,255,255,.25)"/>
    <circle cx="30" cy="24" r="14" fill="rgba(255,255,255,.15)"/>
  </svg>
@endif
