class StrCompareTc extends HTMLElement {
  constructor() {
    super();

    this.shadow = this.attachShadow({ mode: 'open' });
    this.div = document.createElement('div');
    this.shadow.appendChild(this.div);
  }

  connectedCallback() {
    this.render();
  }

  render() {
    // get attributes
    const compareMode = this.getAttribute('compare-mode') || 'first-line';
    const rotateColors = this.getAttribute('rotate-colors') === 'true';
    const separatorChar = this.getAttribute('separator-char') || '';

    // get strings from data elements
    const strings = this.getInputStrings(separatorChar);

    // compare strings -> returns prepared html string
    const comparedStrings = this.compareStrings(
      strings,
      compareMode,
      rotateColors,
    );

    // render html
    this.div.innerHTML = `<div style="font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', monospace;">
    ${comparedStrings.map((str) => `<div>${str}</div>`).join('')}
    </div>`;
  }

  getInputStrings(separatorChar) {
    const dataEls = Array.from(this.querySelectorAll('data'));
    const strings = [];

    dataEls.forEach((el) => {
      if (separatorChar) {
        strings.push(...el.textContent.split(separatorChar));
      } else {
        strings.push(el.textContent);
      }
    });

    return strings;
  }

  // eslint-disable-next-line class-methods-use-this
  compareStrings(strings, compareMode, rotateColors) {
    const highlightedStrings = [];

    strings.forEach((str, index) => {
      if (index === 0) {
        highlightedStrings.push(str);
        return;
      }

      const reference =
        compareMode === 'previous-line' ? strings[index - 1] : strings[0];
      let highlightedStr = '';

      const max = Math.max(str.length, reference.length);

      for (let i = 0; i < max; i += 1) {
        const highlightColor = rotateColors ? (index % 6) + 1 * 2 : null;
        const highlightStyle = highlightColor
          ? `style="background: var(--u-color-${highlightColor}); color: var(--u-color-${highlightColor}-contrast);"`
          : '';

        if (!str[i]) {
          highlightedStr += `<mark ${highlightStyle} >&nbsp;</mark>`;
        } else if (str[i] !== reference[i]) {
          highlightedStr += `<mark ${highlightStyle} >${str[i]}</mark>`;
        } else {
          highlightedStr += str[i];
        }
      }

      highlightedStrings.push(highlightedStr);
    });

    return highlightedStrings;
  }
}

if (!customElements.get('x-str-compare-tc')) {
  customElements.define('x-str-compare-tc', StrCompareTc);
}
