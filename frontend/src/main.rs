use log::Level;
use wasm_logger;
use yew::prelude::*;
use yew::Renderer;

use rustic_wave_frontend_lib::components::header::Header;
use rustic_wave_frontend_lib::pages::home::Home;

#[function_component(App)]
fn app() -> Html {
    html! {
        <div>
            <Header />
            <Home />
        </div>
    }
}

fn main() {
    wasm_logger::init(wasm_logger::Config::new(Level::Info));
    Renderer::<App>::new().render();
}
