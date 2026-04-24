@extends ('layout.layout')

@section ('title', 'Página en Construcción - Vittorio')

@section ('content')
<div class="construction-page">
  <div class="construction-container">
    <div class="construction-icon">
      <i data-lucide="hard-hat"></i>
    </div>
    <h1 class="construction-title">Página en Construcción</h1>
    <p class="construction-text">Estamos trabajando para traerte esta sección pronto.</p>
    <a href="{{ url('/') }}" class="btn-home">Volver al Inicio</a>
  </div>
</div>

<style>
.construction-page {
  min-height: calc(100vh - 80px);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
  background-color: #0a0a0a;
}

.construction-container {
  text-align: center;
  max-width: 500px;
}

.construction-icon {
  margin-bottom: 2rem;
}

.construction-icon i {
  width: 80px;
  height: 80px;
  color: rgba(255, 255, 255, 0.3);
}

.construction-title {
  font-size: 2rem;
  font-weight: 700;
  color: #ffffff;
  letter-spacing: -0.02em;
  margin-bottom: 1rem;
}

.construction-text {
  font-size: 1rem;
  color: rgba(255, 255, 255, 0.5);
  margin-bottom: 2rem;
}

.btn-home {
  display: inline-block;
  padding: 1rem 2rem;
  background-color: #ffffff;
  color: #000000;
  text-decoration: none;
  font-size: 0.875rem;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  transition: all 0.3s ease;
}

.btn-home:hover {
  background-color: rgba(255, 255, 255, 0.9);
  transform: translateY(-1px);
}
</style>
@endsection