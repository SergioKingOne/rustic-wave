use super::header::Header;
use yew::prelude::*;

#[derive(Properties, PartialEq)]
pub struct LayoutProps {
    pub children: Children,
}

#[function_component(Layout)]
pub fn layout(props: &LayoutProps) -> Html {
    html! {
        <div class="layout">
            <Header />
            <div class="content">
                { props.children.clone() }
            </div>
            <footer class="footer">
                <p>{ "Built with Rust + WebAssembly • Powered by AWS" }</p>
                <div class="footer-links">
                    <a href="https://github.com/SergioKingOne/rustic_wave" target="_blank">{ "GitHub" }</a>
                    <a href="/docs">{ "Documentation" }</a>
                </div>
            </footer>
        </div>
    }
}
