$(document).ready(function () {
  $('table#pictures a').lightBox({
    imageLoading:  '/images/lightbox-ico-loading.gif',
    imageBtnPrev:  '/images/lightbox-btn-prev.gif',
    imageBtnNext:  '/images/lightbox-btn-next.gif',
    imageBtnClose: '/images/lightbox-btn-close.gif',
    imageBlank:    '/images/lightbox-blank.gif'
  });
});