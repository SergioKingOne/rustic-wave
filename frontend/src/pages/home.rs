use yew::prelude::*;

#[function_component(Home)]
pub fn home() -> Html {
    html! {
        <main class="home">
            <section class="hero">
                <div class="hero-content">
                    <h1>{ "Modern Static Site Hosting" }</h1>
                    <p class="hero-subtitle">{ "Learn AWS infrastructure by example" }</p>
                    <div class="cta-buttons">
                        <a href="/infrastructure" class="button primary">{ "View Infrastructure" }</a>
                        <a href="https://github.com/SergioKingOne/rustic-wave" class="button secondary" target="_blank">
                            { "View Source" }
                        </a>
                    </div>
                </div>
            </section>

            <section class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">{ "🪣" }</div>
                    <h3>{ "Amazon S3" }</h3>
                    <p>{ "Secure and scalable static content storage with 99.999999999% durability" }</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">{ "🌐" }</div>
                    <h3>{ "CloudFront CDN" }</h3>
                    <p>{ "Global content delivery with ultra-low latency through 410+ Points of Presence" }</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">{ "🔄" }</div>
                    <h3>{ "Route 53" }</h3>
                    <p>{ "Enterprise-grade DNS management with 100% availability SLA" }</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">{ "🔒" }</div>
                    <h3>{ "SSL/TLS" }</h3>
                    <p>{ "Free SSL certificates and secure content delivery via HTTPS" }</p>
                </div>
            </section>

            <section class="tech-stack">
                <h2>{ "Modern Tech Stack" }</h2>
                <div class="tech-grid">
                    <div class="tech-item">
                        <h4>{ "Frontend" }</h4>
                        <ul>
                            <li>{ "Rust + Yew" }</li>
                            <li>{ "WebAssembly" }</li>
                            <li>{ "Modern CSS" }</li>
                        </ul>
                    </div>
                    <div class="tech-item">
                        <h4>{ "Infrastructure" }</h4>
                        <ul>
                            <li>{ "AWS CloudFormation" }</li>
                            <li>{ "GitHub Actions" }</li>
                            <li>{ "Terraform" }</li>
                        </ul>
                    </div>
                    <div class="tech-item">
                        <h4>{ "Security" }</h4>
                        <ul>
                            <li>{ "AWS IAM" }</li>
                            <li>{ "CloudFront Functions" }</li>
                            <li>{ "Origin Access Identity" }</li>
                        </ul>
                    </div>
                </div>
            </section>
        </main>
    }
}
