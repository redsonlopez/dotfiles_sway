config.load_autoconfig(False)

c.statusbar.show = 'in-mode'

c.qt.args = [
    "--disable-gpu",
    "--disable-gpu-compositing",
    "--disable-gpu-rasterization",
    "--disable-webgl",
    "--disable-webgl2",
    "--disable-accelerated-2d-canvas",
    "--disable-accelerated-video-decode",
    "--disable-accelerated-mjpeg-decode",
    "--disable-smooth-scrolling",
    "--no-sandbox",
    "--disable-dev-shm-usage",
    "--disable-features=VizDisplayCompositor,UseSkiaRenderer,CanvasOopRasterization"
]

c.content.cache.size = 50 * 1024 * 1024
c.content.javascript.enabled = True
config.set('content.javascript.enabled', True, 'https://www.youtube.com/')
c.auto_save.session = False
c.history_gap_interval = 3600
c.content.images = True

