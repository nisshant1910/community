import Component from "@glimmer/component";
import { service } from "@ember/service";

// Shows only to logged-out visitors on the home/latest/categories pages.
export default class StratzyHero extends Component {
  @service currentUser;
  @service router;

  get show() {
    return (
      !this.currentUser &&
      ["discovery.latest", "discovery.categories"].includes(
        this.router.currentRouteName
      )
    );
  }

  <template>
    {{#if this.show}}
      <div class="stratzy-home">
        <section class="stratzy-hero">
          <div class="stratzy-hero__copy">
            <span class="stratzy-hero__eyebrow">Algo trading, explained calmly</span>
            <h1>Ask
              <span class="stratzy-accent">better questions</span>
              about algo trading.</h1>
            <p>A calm place for Indian traders to learn how strategies work,
              share what they have noticed, and get answers from people who
              build them.</p>
            <div class="stratzy-hero__cta">
              <a class="btn btn-primary" href="/signup">Join the community</a>
              <a class="stratzy-hero__link" href="/latest">See what people are asking &rarr;</a>
            </div>
            <small>Educational discussion only, not investment advice. SEBI
              Research Analyst INH000009180.</small>
          </div>
          <div class="stratzy-hero__card" aria-hidden="true">
            <div class="stratzy-hero__cardhead"><span>Equity curve</span><span>Illustrative only</span></div>
            <svg viewBox="0 0 400 190" width="100%">
              <g stroke="#EFE9DC" stroke-width="1"><line x1="0" y1="40" x2="400" y2="40" /><line x1="0" y1="90" x2="400" y2="90" /><line x1="0" y1="140" x2="400" y2="140" /></g>
              <polyline class="stratzy-draw" pathLength="1" points="0,150 40,138 80,144 120,112 160,120 200,88 240,96 280,64 320,74 360,44 400,52" fill="none" stroke="#01AD60" stroke-width="2.5" stroke-linejoin="round" />
              <polygon class="stratzy-fade" points="0,150 40,138 80,144 120,112 160,120 200,88 240,96 280,64 320,74 360,44 400,52 400,190 0,190" fill="#01C36D" />
            </svg>
            <div class="stratzy-hero__cardfoot">Sample graphic, not real performance data.</div>
          </div>
        </section>

        <section class="stratzy-cards">
          <div class="stratzy-card stratzy-card--warm">
            <h3>Nobody should figure out algos alone.</h3>
            <p>Ask without feeling silly. Share what you noticed. Your question
              could help someone else understand a strategy before they use it.</p>
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
        </section>
      </div>
    {{/if}}
  </template>
}
