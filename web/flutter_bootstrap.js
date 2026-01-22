{{flutter_js}}
{{flutter_build_config}}

function delay(time) {
    return new Promise(resolve => setTimeout(resolve, time));
}

window.addEventListener('load', (_) => {
    const loader = document.getElementById("loader");
    _flutter.loader.load({
        onEntrypointLoaded: async function (engineInitializer) {
            const appRunner = await engineInitializer.initializeEngine({
                useColorEmoji: true,
            });
            // Start transition to top-left corner (where Hero widget appears)
            loader.classList.add("transitioning");
            // Register event listener BEFORE runApp() to catch the first frame event
            window.addEventListener('flutter-first-frame', function() {
                if (loader && loader.parentNode) {
                    loader.parentNode.removeChild(loader);
                }
            }, { once: true });
            // Start Flutter app during transition
            await delay(0.7);
            await appRunner.runApp();
        }
    });
});
