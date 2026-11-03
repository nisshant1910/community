import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import { service } from "@ember/service";

// Home (latest) page: hero for logged-out visitors, title block + right rail for everyone.
export default class StratzyHome extends Component {
  @service currentUser;
  @service router;
  @service composer;

  get onLatest() {
    return this.router.currentRouteName === "discovery.latest";
  }

  get showHero() {
    return !this.currentUser && this.onLatest;
  }

  @action
  ask() {
    if (this.currentUser) {
      this.composer.openNewTopic({});
    } else {
      window.location.href = "/login";
    }
  }

  <template>
    {{#if this.onLatest}}
      {{#if this.showHero}}
        <section class="stratzy-hero">
          <div class="stratzy-hero__copy">
            <span class="stratzy-hero__eyebrow">By algo traders, for algo traders</span>
            <h1>Ask
              <span class="stratzy-accent">better questions</span>
              about algo trading.</h1>
            <p>Ask anything about strategies, risk, or the platform. People who
              have been through the same will help you out.</p>
            <div class="stratzy-hero__cta">
              <a class="btn btn-primary" href="/signup">Join the community</a>
              <a class="stratzy-hero__link" href="/latest">See what people are asking &rarr;</a>
            </div>
          </div>
          <div class="stratzy-hero__art" aria-hidden="true">
            <svg viewBox="0 0 360 230" width="100%">
              <rect x="196" y="96" width="124" height="96" rx="14" fill="#B9E8D0" />
              <rect x="86" y="44" width="170" height="130" rx="14" fill="#fff" stroke="#E8E2D4" />
              <path d="M120 174 L120 196 L146 174 Z" fill="#fff" stroke="#E8E2D4" />
              <g stroke="#EFE9DC"><line x1="106" y1="90" x2="236" y2="90" /><line x1="106" y1="120" x2="236" y2="120" /><line x1="106" y1="150" x2="236" y2="150" /></g>
              <polyline class="stratzy-draw" pathLength="1" points="106,150 132,136 154,142 180,112 204,120 236,78" fill="none" stroke="#01AD60" stroke-width="3" stroke-linejoin="round" stroke-linecap="round" />
              <rect x="268" y="14" width="64" height="64" rx="10" fill="#EFE9DC" />
              <g stroke="#018A4D" stroke-width="2"><line x1="284" y1="30" x2="284" y2="62" /><line x1="300" y1="26" x2="300" y2="56" /><line x1="316" y1="34" x2="316" y2="64" /></g>
              <g fill="#01AD60"><rect x="279" y="38" width="10" height="16" rx="2" /><rect x="295" y="34" width="10" height="14" rx="2" /><rect x="311" y="42" width="10" height="14" rx="2" /></g>
              <rect x="22" y="138" width="64" height="64" rx="10" fill="#E6F4EC" />
              <circle cx="54" cy="170" r="14" fill="#01AD60" />
              <path d="M47 170 l5 5 l9 -10" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" />
            </svg>
            <div class="stratzy-hero__caption">No hype. No trade calls. Just honest answers.</div>
          </div>
        </section>
      {{/if}}

      <div class="stratzy-listhead">
        <div>
          <h2>What traders are talking about</h2>
          <p>Questions, strategy discussions and tips from other traders.</p>
        </div>
        <button type="button" class="stratzy-ask" {{on "click" this.ask}}>+ Ask a question</button>
      </div>

      <aside class="stratzy-rail">
        <div class="stratzy-card stratzy-card--warm">
          <h3>Nobody should figure out algos alone.</h3>
          <p>Ask without feeling silly. Share what you noticed. Your question
            could help someone understand a strategy before they use it.</p>
          <a href="/guidelines">How we keep this place helpful &rarr;</a>
        </div>
        <div class="stratzy-card">
          <h3>New here?</h3>
          <ol class="stratzy-steps">
            <li><b>Say hello</b><span>Tell us who you are and what brought you here.</span></li>
            <li><b>Find your topic</b><span>Learning, strategies, platform help. Pick what you need.</span></li>
            <li><b>Ask your question</b><span>Share the details. Someone will help.</span></li>
          </ol>
        </div>
        <p class="stratzy-disclaimer">Discussions here are educational and are not
          investment advice. SEBI Research Analyst INH000009180.</p>
      </aside>
    {{/if}}
  </template>
}
