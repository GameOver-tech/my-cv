const revealElements = document.querySelectorAll('.section, .hero-content');

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
}, {
  threshold: 0.18,
});

revealElements.forEach((element) => observer.observe(element));

const links = document.querySelectorAll('a[href^="#"]');
links.forEach((link) => {
  link.addEventListener('click', (event) => {
    const targetId = link.getAttribute('href').slice(1);
    const target = document.getElementById(targetId);
    if (target) {
      event.preventDefault();
      target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  });
});

:root {
  color-scheme: dark;
  --bg: #050505;
  --surface: rgba(20, 20, 20, 0.95);
  --surface-strong: #111111;
  --gold: #d8b46c;
  --gold-soft: #f4de9a;
  --text: #f6f2e9;
  --muted: #9a8f7a;
  --border: rgba(216, 180, 108, 0.18);
  --shadow: 0 20px 70px rgba(0, 0, 0, 0.45);
}

* {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  min-height: 100vh;
  font-family: 'Inter', sans-serif;
  background: radial-gradient(circle at top, rgba(255, 217, 126, 0.06), transparent 28%),
    linear-gradient(180deg, #070707 0%, #020202 100%);
  color: var(--text);
}

.page-shell {
  max-width: 1180px;
  margin: 0 auto;
  padding: 24px 28px 48px;
}

.topbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 0 32px;
}

.brand {
  color: var(--gold);
  font-weight: 800;
  letter-spacing: 0.16em;
  text-transform: uppercase;
}

.nav-links {
  display: flex;
  gap: 24px;
  flex-wrap: wrap;
}

.nav-links a {
  color: var(--muted);
  text-decoration: none;
  font-size: 0.95rem;
  transition: color 0.25s ease;
}

.nav-links a:hover {
  color: var(--gold);
}

.section {
  margin-top: 48px;
  opacity: 0;
  transform: translateY(26px);
  transition: opacity 0.8s ease, transform 0.8s ease;
}

.section.visible {
  opacity: 1;
  transform: translateY(0);
}

.section-header {
  display: flex;
  align-items: baseline;
  gap: 16px;
  margin-bottom: 24px;
}

.section-header span {
  color: var(--gold);
  font-size: 0.95rem;
  letter-spacing: 0.14em;
  font-weight: 700;
}

.section-header h2 {
  margin: 0;
  font-size: clamp(2rem, 3vw, 2.5rem);
  letter-spacing: -0.04em;
}

.hero {
  min-height: calc(100vh - 120px);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 80px 0;
  position: relative;
  overflow: hidden;
}

.hero::before {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at top right, rgba(216, 180, 108, 0.18), transparent 22%),
    radial-gradient(circle at bottom left, rgba(255, 255, 255, 0.08), transparent 18%);
  pointer-events: none;
}

.hero-content {
  position: relative;
  z-index: 1;
  max-width: 780px;
}

.eyebrow {
  text-transform: uppercase;
  color: var(--gold);
  letter-spacing: 0.24em;
  font-size: 0.85rem;
}

.hero h1 {
  margin: 16px 0;
  font-size: clamp(3rem, 6vw, 5rem);
  line-height: 0.95;
  letter-spacing: -0.06em;
}

.hero p {
  margin: 16px 0 32px;
  max-width: 700px;
  font-size: 1.1rem;
  color: var(--muted);
  line-height: 1.8;
}

.hero-actions {
  display: flex;
  gap: 18px;
  flex-wrap: wrap;
}

.button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 50px;
  padding: 0 30px;
  border-radius: 999px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  text-decoration: none;
  transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.25s ease;
}

.button:hover {
  transform: translateY(-2px);
}

.button-gold {
  background: linear-gradient(135deg, rgba(216, 180, 108, 1), rgba(248, 220, 138, 0.95));
  color: #111;
  box-shadow: 0 0 30px rgba(216, 180, 108, 0.25);
}

.button-transparent {
  border: 1px solid rgba(216, 180, 108, 0.5);
  color: var(--text);
  background: transparent;
}

.card-glow {
  background: linear-gradient(180deg, rgba(17, 17, 17, 0.98), rgba(9, 9, 9, 0.92));
  border: 1px solid rgba(216, 180, 108, 0.18);
  box-shadow: var(--shadow);
  border-radius: 28px;
  padding: 28px;
}

.section-body p {
  margin: 0 0 20px;
  line-height: 1.8;
  color: var(--muted);
}

.quick-facts {
  display: grid;
  gap: 14px;
  grid-template-columns: repeat(3, minmax(140px, 1fr));
}

.quick-facts div {
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 18px;
  padding: 14px 18px;
  color: var(--text);
  font-size: 0.95rem;
}

.skill-grid,
.activity-grid,
.education-grid,
.contact-grid {
  display: grid;
  gap: 18px;
}

.skill-card,
.education-card,
.admin-item,
.interest-list div,
.activity-grid div,
.contact-grid div {
  background: rgba(255, 255, 255, 0.04);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 20px;
  padding: 20px 24px;
  color: var(--text);
  font-size: 1rem;
  font-weight: 500;
}

.skill-card {
  position: relative;
  overflow: hidden;
}

.skill-card::after {
  content: '';
  position: absolute;
  inset: 0;
  background: radial-gradient(circle at top left, rgba(216, 180, 108, 0.18), transparent 24%);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.skill-card:hover::after {
  opacity: 1;
}

.education-grid {
  grid-template-columns: repeat(2, minmax(220px, 1fr));
}

.education-card h3,
.experience-card h3,
.admin-item strong {
  margin: 0 0 8px;
  font-size: 1.05rem;
  color: var(--gold);
}

.education-card span,
.experience-card span,
.admin-item span {
  color: var(--muted);
  display: block;
  margin-bottom: 14px;
}

.experience-card {
  max-width: 720px;
}

.project-card {
  max-width: 760px;
}

.admin-panel {
  display: grid;
  grid-template-columns: 1.4fr 1fr;
  gap: 26px;
  align-items: stretch;
}

.admin-text ul {
  margin: 18px 0 0;
  padding-left: 20px;
  color: var(--muted);
}

.admin-text li {
  margin-bottom: 10px;
}

.admin-actions {
  display: grid;
  gap: 16px;
}

.admin-item {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.interest-list,
.activity-grid,
.contact-grid {
  grid-template-columns: repeat(2, minmax(180px, 1fr));
}

.footer {
  margin-top: 50px;
  padding-top: 28px;
  border-top: 1px solid rgba(216, 180, 108, 0.12);
  text-align: center;
  color: var(--muted);
  font-size: 0.95rem;
}

.footer p {
  margin: 0 0 12px;
  color: var(--text);
  font-style: italic;
}

.section-glow,
.card-glow {
  border-radius: 34px;
}

@media (max-width: 900px) {
  .page-shell {
    padding: 20px 20px 36px;
  }

  .nav-links {
    gap: 14px;
  }

  .quick-facts,
  .education-grid,
  .admin-panel,
  .interest-list,
  .activity-grid,
  .contact-grid {
    grid-template-columns: 1fr;
  }

  .hero {
    min-height: 80vh;
    padding-top: 40px;
  }

  .hero h1 {
    font-size: clamp(2.5rem, 9vw, 3.6rem);
  }
}

@media (max-width: 640px) {
  .topbar {
    flex-direction: column;
    align-items: flex-start;
    gap: 16px;
  }

  .hero-actions {
    width: 100%;
    flex-direction: column;
  }

  .button {
    width: 100%;
  }

  .section {
    margin-top: 36px;
  }
}

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Ali Hassan | Future Tech Leader</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <div class="page-shell">
    <header class="topbar">
      <div class="brand">Ali Hassan</div>
      <nav class="nav-links">
        <a href="#about">About</a>
        <a href="#skills">Skills</a>
        <a href="#projects">Projects</a>
        <a href="#contact">Contact</a>
      </nav>
    </header>

    <main>
      <section class="hero section-glow" id="hero">
        <div class="hero-content">
          <span class="eyebrow">Premium Technology Portfolio</span>
          <h1>Ali Hassan &ndash; Future Tech Leader</h1>
          <p>AI Enthusiast | Cyber Security | Ethical Hacker | E-commerce Learner</p>
          <div class="hero-actions">
            <a class="button button-gold" href="#contact">Hire Me</a>
            <a class="button button-transparent" href="#projects">View My Work</a>
          </div>
        </div>
      </section>

      <section class="section about" id="about">
        <div class="section-header">
          <span>01</span>
          <h2>About Me</h2>
        </div>
        <div class="section-body card-glow">
          <p>I am a motivated and disciplined individual who believes in hard work, learning, and honesty. My mission is to grow in the field of Artificial Intelligence, Cyber Security, and technology, while helping others through knowledge and innovation.</p>
          <div class="quick-facts">
            <div><strong>Location  :</strong>Gojra, Pakistan</div>
            <div><strong>Born :</strong>28 April 2005</div>
            <div><strong>Focus  :</strong>AI, Cyber Security, Leadership</div>
          </div>
        </div>
      </section>

      <section class="section skills" id="skills">
        <div class="section-header">
          <span>02</span>
          <h2>Skills</h2>
        </div>
        <div class="skill-grid card-glow">
          <div class="skill-card">Communication Skills</div>
          <div class="skill-card">Artificial Intelligence</div>
          <div class="skill-card">Cyber Security</div>
          <div class="skill-card">Ethical Hacking</div>
          <div class="skill-card">E-commerce</div>
          <div class="skill-card">Python</div>
          <div class="skill-card">JavaScript</div>
        </div>
      </section>

      <section class="section experience" id="experience">
        <div class="section-header">
          <span>03</span>
          <h2>Experience</h2>
        </div>
        <div class="section-body card-glow">
          <div class="experience-card">
            <h3>Teacher at Roma Asian Union</h3>
            <span>2020 &ndash; Present</span>
            <p>Teaching and guiding students, building communication and leadership skills.</p>
          </div>
        </div>
      </section>

      <section class="section projects" id="projects">
        <div class="section-header">
          <span>04</span>
          <h2>Projects</h2>
        </div>
        <div class="section-body card-glow project-card">
          <h3>Helping The People (HTP)</h3>
          <p>A mission-based project to educate people about advanced technology and Artificial Intelligence in a simple and fast way.</p>
        </div>
      </section>

      <section class="section education" id="education">
        <div class="section-header">
          <span>05</span>
          <h2>Education</h2>
        </div>
        <div class="education-grid card-glow">
          <div class="education-card">
            <h3>Intermediate (ICS)</h3>
            <span>Quaid Azam College Gojra</span>
            <p>1030 / 1200</p>
          </div>
          <div class="education-card">
            <h3>Matric (Science)</h3>
            <span>Govt Islamia High School Gojra</span>
            <p>863 / 1100</p>
          </div>
        </div>
      </section>

      <section class="section interests" id="interests">
        <div class="section-header">
          <span>06</span>
          <h2>Interests</h2>
        </div>
        <div class="interest-list card-glow">
          <div>Technology and AI learning</div>
          <div>Personal development and logical thinking</div>
          <div>Helping others through knowledge</div>
        </div>
      </section>

      <section class="section activities" id="activities">
        <div class="section-header">
          <span>07</span>
          <h2>Activities</h2>
        </div>
        <div class="activity-grid card-glow">
          <div>Self-learning and online study</div>
          <div>Physical fitness and discipline</div>
          <div>Teamwork and coordination</div>
          <div>Basketball (Olympiad Level Player)</div>
        </div>
      </section>

      <section class="section admin" id="admin">
        <div class="section-header">
          <span>08</span>
          <h2>Admin Panel Idea</h2>
        </div>
        <div class="card-glow admin-panel">
          <div class="admin-text">
            <p>Designed for future updates to projects and skills, this admin panel concept streamlines content management with a trusted, secure interface.</p>
            <ul>
              <li>Update project titles, descriptions, and featured work</li>
              <li>Manage skill list and highlight new expertise</li>
              <li>Keep the portfolio current with fast control and strong structure</li>
            </ul>
          </div>
          <div class="admin-actions">
            <div class="admin-item">
              <strong>Projects</strong>
              <span>Editable cards, featured highlights</span>
            </div>
            <div class="admin-item">
              <strong>Skills</strong>
              <span>Organized skill tags, priority updates</span>
            </div>
          </div>
        </div>
      </section>

      <section class="section contact" id="contact">
        <div class="section-header">
          <span>09</span>
          <h2>Contact</h2>
        </div>
        <div class="contact-grid card-glow">
          <div><strong>Phone :</strong>03102850365</div>
          <div><strong>Email :</strong>alihassansoftware0786@gmail.com</div>
          <div><strong>Location :</strong>Gojra, Pakistan</div>
        </div>
      </section>
    </main>

    <footer class="footer">
      <p>"Everything is possible in the world. A nation rises when we work together."</p>
      <small>Ali Hassan | Future Tech Leader</small>
    </footer>
  </div>
  <script src="script.js"></script>
</body>
</html>
