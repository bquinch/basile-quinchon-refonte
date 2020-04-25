const scrollSite = () => {
  const phone = document.getElementById('phone')
  const site = document.getElementById('site')
  window.addEventListener('scroll', (event) => {
    if (window.scrollY > 2103) {
      const pourcentage = (window.scrollY - 2103) * 100 / 800
      phone.style.backgroundPosition = `center ${pourcentage}%`;
      site.style.backgroundPosition = `center ${pourcentage}%`;
    }
  })
}

export { scrollSite };
