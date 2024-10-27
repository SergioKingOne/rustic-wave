use yew::prelude::*;

#[function_component(Header)]
pub fn header() -> Html {
    html! {
        <header>
            <h1>{ "Rustc-Wave" }</h1>
            <nav>
                <ul>
                    <li><a href="/">{ "Home" }</a></li>
                    <li><a href="/about">{ "About" }</a></li>
                    <li><a href="/contact">{ "Contact" }</a></li>
                </ul>
            </nav>
        </header>
    }
}
