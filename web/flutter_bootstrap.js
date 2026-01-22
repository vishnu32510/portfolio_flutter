{{flutter_js}}
{{flutter_build_config}}

function delay(time) {
    return new Promise(resolve => setTimeout(resolve, time));
}

window.addEventListener('load', (_) => {
    const loader = document.getElementById("loader");
    const MIN_SPLASH_DURATION = 400; 
    let splashStartTime = Date.now();
    let firstFrameRendered = false;
    let minDurationElapsed = false;

    function removeLoader() {
        if (loader && loader.parentNode && firstFrameRendered && minDurationElapsed) {
            loader.parentNode.removeChild(loader);
        }
    }

    function checkAndRemove() {
        if (firstFrameRendered && minDurationElapsed) {
            removeLoader();
        }
    }

    _flutter.loader.load({
        onEntrypointLoaded: async function (engineInitializer) {
            const appRunner = await engineInitializer.initializeEngine({
                useColorEmoji: true,
            });
            
            // Register event listener BEFORE runApp() to catch the first frame event
            window.addEventListener('flutter-first-frame', function() {
                firstFrameRendered = true;
                checkAndRemove();
            }, { once: true });

            // Ensure minimum splash duration
            setTimeout(() => {
                minDurationElapsed = true;
                checkAndRemove();
            }, MIN_SPLASH_DURATION);

            // Start transition to top-left corner (where Hero widget appears)
            // Wait a bit before starting transition to ensure splash is visible
            await delay(200);
            loader.classList.add("transitioning");
            
            // Start Flutter app during transition
            await delay(200);
            await appRunner.runApp();
        }
    });
});
