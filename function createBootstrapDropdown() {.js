function createBootstrapDropdown() {
  if (instance.element.querySelector('.dropdown-menu')) { return; }
  
  const wrapper = instance.element.querySelector('.input-group');
  const input = wrapper.querySelector('input');
  const suffixBtn = wrapper.querySelector('.input-group-append');

  // Update button to Bootstrap dropdown toggle
  suffixBtn.innerHTML = '<button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Select</button>';

  // Create Bootstrap dropdown menu
  const dropdownMenu = document.createElement('ul');
  dropdownMenu.className = 'dropdown-menu';
  
  const options = ['°F', '°C'];
  options.forEach(opt => {
    dropdownMenu.innerHTML += '<li><a class="dropdown-item" href="#">' + opt +'</a></li>';
  });

  // Append dropdown to wrapper
  wrapper.appendChild(dropdownMenu);
  const dropdownButton = suffixBtn.querySelector('button');

  // Manual toggle functionality
  const toggleDropdown = () => {
    const isExpanded = dropdownButton.getAttribute('aria-expanded') === 'true';
    dropdownButton.setAttribute('aria-expanded', !isExpanded);
    dropdownMenu.classList.toggle('show');
  };

  // Toggle on button click
  dropdownButton.addEventListener('click', (e) => {
    e.stopPropagation();
    toggleDropdown();
  });

  // Close on outside click
  document.addEventListener('click', () => {
    dropdownMenu.classList.remove('show');
    dropdownButton.setAttribute('aria-expanded', 'false');
  });

  // Handle option selection
  dropdownMenu.addEventListener('click', (e) => {
    if (e.target.classList.contains('dropdown-item')) {
      e.preventDefault();
      e.stopPropagation();
      input.value = e.target.textContent;
      dropdownMenu.classList.remove('show');
      dropdownButton.setAttribute('aria-expanded', 'false');
    }
  });
  
}

// Initialize dropdown
if (instance) {
  createBootstrapDropdown();
}