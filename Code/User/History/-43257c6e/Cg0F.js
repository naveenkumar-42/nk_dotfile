function toggleMenu() {
  document.querySelector('.menu-links').classList.toggle('active');
}

// Close menu when clicking outside (for mobile only)
document.addEventListener('click', function (event) {
  const menu = document.querySelector('.menu-links');
  const menuIcon = document.querySelector('.menu-icon');

  if (!menu.contains(event.target) && !menuIcon.contains(event.target)) {
    menu.classList.remove('active');
  }
});