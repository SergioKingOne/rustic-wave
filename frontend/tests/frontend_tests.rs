#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::*;
    use yew::Renderer;

    wasm_bindgen_test::wasm_bindgen_test_configure!(run_in_browser);

    #[wasm_bindgen_test]
    fn test_header_render() {
        let header = Renderer::<rustic_wave_frontend_lib::components::header::Header>::new();
        header.render();
        // Add assertions as needed
    }
}
