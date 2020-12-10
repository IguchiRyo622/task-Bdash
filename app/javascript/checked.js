$(function check() {
  const items = document.querySelectorAll(".items");
  items.forEach(function (item) {
    if (item.getAttribute("data-load") != null) {
      return null;
    }
    item.setAttribute("data-load", "true");
    item.addEventListener("click", () => {
      const itemId = item.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/items/${itemId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        const post = XHR.response.item;
        if (post.check == true) {
          item.setAttribute("data-check", "true");
        } else if (post.check == false) {
          item.removeAttribute("data-check");
        }
      };
    });
  },1000);
});