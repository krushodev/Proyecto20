@extends ('layout.layout')

@section ('title', 'Iniciar Sesión - Vittorio')

@section ('content')
<div class="login-page">
  <div class="login-container">
    <div class="login-header">
      <h1 class="login-title">Bienvenido</h1>
      <p class="login-subtitle">Ingresá a tu cuenta Vittorio</p>
    </div>

    <form class="login-form" action="{{ url('/') }}" method="GET">
      <div class="form-group">
        <label for="email" class="form-label">Email</label>
        <input 
          type="email" 
          id="email" 
          name="email" 
          class="form-input" 
          placeholder="tu@email.com" 
          required
        />
      </div>

      <div class="form-group">
        <label for="password" class="form-label">Contraseña</label>
        <input 
          type="password" 
          id="password" 
          name="password" 
          class="form-input" 
          placeholder="••••••••" 
          required
        />
      </div>

      <div class="form-options">
        <label class="checkbox-container">
          <input type="checkbox" name="remember" />
          <span class="checkmark"></span>
          <span class="checkbox-label">Recordarme</span>
        </label>
        <a href="#" class="forgot-link">¿Olvidaste tu contraseña?</a>
      </div>

      <button type="submit" class="btn-login">Iniciar Sesión</button>
    </form>

    <div class="login-footer">
      <p class="register-text">
        ¿No tenés cuenta? 
        <a href="{{ url('/registro') }}" class="register-link">Crear cuenta</a>
      </p>
    </div>
  </div>
</div>
@endsection

<style>
.login-page {
  min-height: calc(100vh - 80px);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
  background-color: #0a0a0a;
}

.login-container {
  width: 100%;
  max-width: 420px;
  padding: 3rem;
  background-color: #0e0e0e;
  border: 1px solid rgba(255, 255, 255, 0.08);
}

.login-header {
  text-align: center;
  margin-bottom: 2.5rem;
}

.login-title {
  font-size: 1.75rem;
  font-weight: 700;
  color: #ffffff;
  letter-spacing: -0.02em;
  margin-bottom: 0.5rem;
}

.login-subtitle {
  font-size: 0.875rem;
  color: rgba(255, 255, 255, 0.5);
  letter-spacing: 0.05em;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.form-label {
  font-size: 0.75rem;
  font-weight: 600;
  color: rgba(255, 255, 255, 0.7);
  letter-spacing: 0.1em;
  text-transform: uppercase;
}

.form-input {
  padding: 1rem;
  background-color: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #ffffff;
  font-size: 1rem;
  transition: all 0.3s ease;
}

.form-input::placeholder {
  color: rgba(255, 255, 255, 0.3);
}

.form-input:focus {
  outline: none;
  border-color: rgba(255, 255, 255, 0.3);
  background-color: rgba(255, 255, 255, 0.05);
}

.form-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 0.875rem;
}

.checkbox-container {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
  color: rgba(255, 255, 255, 0.6);
}

.checkbox-container input {
  display: none;
}

.checkmark {
  width: 18px;
  height: 18px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}

.checkbox-container input:checked + .checkmark {
  background-color: #ffffff;
  border-color: #ffffff;
}

.checkbox-container input:checked + .checkmark::after {
  content: '✓';
  color: #000000;
  font-size: 12px;
  font-weight: bold;
}

.checkbox-label {
  font-size: 0.875rem;
}

.forgot-link {
  color: rgba(255, 255, 255, 0.6);
  text-decoration: none;
  transition: color 0.3s ease;
}

.forgot-link:hover {
  color: #ffffff;
}

.btn-login {
  padding: 1rem 2rem;
  background-color: #ffffff;
  color: #000000;
  border: none;
  font-size: 0.875rem;
  font-weight: 600;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-top: 0.5rem;
}

.btn-login:hover {
  background-color: rgba(255, 255, 255, 0.9);
  transform: translateY(-1px);
}

.btn-login:active {
  transform: translateY(0);
}

.login-footer {
  margin-top: 2rem;
  text-align: center;
}

.register-text {
  font-size: 0.875rem;
  color: rgba(255, 255, 255, 0.5);
}

.register-link {
  color: #ffffff;
  text-decoration: none;
  font-weight: 600;
  transition: opacity 0.3s ease;
}

.register-link:hover {
  opacity: 0.8;
}
</style>