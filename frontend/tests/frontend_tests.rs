#[cfg(test)]
mod tests {
    use rustic_wave_frontend_lib as frontend;
    use wasm_bindgen_test::*;
    use yew::Renderer;

    wasm_bindgen_test::wasm_bindgen_test_configure!(run_in_browser);

    #[wasm_bindgen_test]
    fn test_header_render() {
        let header = Renderer::<frontend::components::header::Header>::new();
        header.render();
        // Add assertions as needed
    }
}
