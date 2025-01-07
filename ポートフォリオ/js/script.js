$(document).ready(function() {
    // フルスクリーンで表示するため、ページをウィンドウサイズに調整
    function resizeFlipbook() {
        $('.flipbook').turn('size', $(window).width(), $(window).height());
    }

    // 初期化
    $('.flipbook').turn({
        width: $(window).width(),
        height: $(window).height(),
        autoCenter: true,
        elevation: 50,
        gradients: true,
        duration: 1000,
        display: 'double' // 両開きで表示
    });

    // ウィンドウサイズ変更時にflipbookをリサイズ
    $(window).on('resize', resizeFlipbook);

    // 方向キーの左右でページをめくる
    $(document).keydown(function(e) {
        if (e.key === "ArrowRight") {
            $('.flipbook').turn("next"); // 次のページ
        } else if (e.key === "ArrowLeft") {
            $('.flipbook').turn("previous"); // 前のページ
        }
    });

    $('[data-page]').on('click', function (e) {
        e.preventDefault();

        // データ属性から移動先のページ番号を取得
        var page = parseInt($(this).data('page'));

        // flipbook の該当ページにジャンプ
        $('.flipbook').turn('page', page);
    });

  });