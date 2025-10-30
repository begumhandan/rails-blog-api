// Büyük JavaScript dosyası - performans testi için
console.log('Local JavaScript loaded');

function initApp() {
    console.log('App initialized');
    
    // Dummy functions to increase file size
    function calculateStats() {
        let total = 0;
        for(let i = 0; i < 10000; i++) {
            total += i;
        }
        return total;
    }
    
    function processData() {
        const data = Array.from({length: 1000}, (_, i) => ({
            id: i,
            value: Math.random() * 100,
            label: `Item ${i}`
        }));
        return data;
    }
    
    function renderUI() {
        console.log('UI rendered');
    }
    
    // Initialize
    calculateStats();
    processData();
    renderUI();
}

document.addEventListener('DOMContentLoaded', initApp);

// More code to increase file size...
function helperFunction1() { /* ... */ }
function helperFunction2() { /* ... */ }
function helperFunction3() { /* ... */ }