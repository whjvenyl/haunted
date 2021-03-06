
export function attach(element) {
  let el = document.createElement(element);
  host.appendChild(el);
  return () => host.removeChild(el);
}

export function afterMutations() {
  return new Promise(resolve => {
    const mo = new MutationObserver(() => {
      mo.disconnect();
      resolve();
    });
    mo.observe(host, { childList: true, subtree: true });
  });
}

export function later(fn = Function.prototype) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(fn());
    }, 80);
  })
}