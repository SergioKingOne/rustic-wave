use yew::prelude::*;

#[function_component(Header)]
pub fn header() -> Html {
    html! {
        <header>
            <h1>{ "AWS Static Site Demo" }</h1>
            <nav>
                <ul>
                    <li><a href="/">{ "Home" }</a></li>
                    <li><a href="/infrastructure">{ "Infrastructure" }</a></li>
                    <li><a href="/deployment">{ "Deployment" }</a></li>
                </ul>
            </nav>
        </header>
    }
}
