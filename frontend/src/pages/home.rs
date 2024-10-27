use yew::prelude::*;

#[function_component(Home)]
pub fn home() -> Html {
    html! {
        <main>
            <section>
                <h2>{ "Welcome to Rustc-Wave" }</h2>
                <p>{ "Building modern static sites with Rust and AWS." }</p>
            </section>
        </main>
    }
}
