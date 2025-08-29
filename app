<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Quantum Tarot Manifestation – Lite</title>
<style>
:root{--bg:#0a0e1e;--glass:#101a3aee;--ink:#f6f8ff;--muted:#b9c3e3;--acc:#ffd96a;--tile:#0d1530;--tileB:#263763}
*{box-sizing:border-box}body{margin:0;font-family:system-ui,Segoe UI,Roboto,Arial,sans-serif;color:var(--ink);background:linear-gradient(180deg,#091125,#0f1733)}
header{position:sticky;top:0;z-index:5;background:#0f1733cc;border-bottom:1px solid #1f2c50;backdrop-filter:blur(6px);padding:10px 12px;display:flex;justify-content:space-between;align-items:center}
h1{margin:0;font-size:1.06rem;color:var(--acc)}
.wrap{max-width:920px;margin:auto;padding:12px}
.card{background:var(--glass);border:1px solid #203058;border-radius:12px;padding:12px;margin:10px 0}
.row{display:flex;gap:8px;flex-wrap:wrap;align-items:center}
button,input,textarea{background:#0f1630;color:var(--ink);border:1px solid #2a3c6b;border-radius:10px;padding:8px 10px}
button{cursor:pointer}
.small{color:var(--muted);font-size:.88rem}
.tabs{display:flex;gap:8px;flex-wrap:wrap;margin:8px 0}
.tab{padding:6px 10px;border:1px solid #2a3c6b;border-radius:10px;background:#0f1630;cursor:pointer}
.tab.active{background:#19307a;border-color:#4a78ff}
.section{display:none}.section.show{display:block}
.grid{display:grid;gap:12px;grid-template-columns:repeat(auto-fit,minmax(200px,1fr))}
.tile{background:var(--tile);border:1px solid var(--tileB);border-radius:10px;padding:8px;display:flex;flex-direction:column;gap:6px}
.tile img{width:100%;aspect-ratio:300/527;object-fit:cover;border-radius:8px;border:1px solid #33497f;background:#0b1230}
.history{list-style:none;margin:0;padding:0;display:grid;gap:6px}
.history li{background:#0f1630;border:1px solid #203058;border-radius:8px;padding:6px}
.skel{min-height:210px;background:#111a3b;border:1px solid #2b3f77;border-radius:8px;position:relative;overflow:hidden}
.skel:after{content:"";position:absolute;inset:0;background:linear-gradient(100deg,transparent 0,rgba(255,255,255,.07) 50%,transparent 100%);transform:translateX(-100%);animation:sh 1.1s infinite}
@keyframes sh{to{transform:translateX(100%)}}
.modalBack{position:fixed;inset:0;background:rgba(0,0,0,.6);display:none;align-items:center;justify-content:center;padding:14px;z-index:20}
.modal{background:#0f1630;border:1px solid #2a3c6b;border-radius:12px;max-width:860px;width:100%;display:grid;gap:12px;grid-template-columns:1fr 1fr}
@media(max-width:840px){.modal{grid-template-columns:1fr}}
.bigimg{width:100%;aspect-ratio:300/527;border-radius:10px;border:1px solid #33497f;background:#0b1230;transition:transform .2s}
.rev{transform:rotate(180deg)}
.flag{display:inline-block;background:#14265a;border:1px solid #355099;color:#cfe0ff;font-size:.78rem;border-radius:7px;padding:3px 7px}
</style>
</head>
<body>
<header><h1>✨ Quantum Tarot Manifestation</h1><div class="small" id="hdr">Ready</div></header>
<div class="wrap">
  <div class="tabs">
    <div class="tab active" data-tab="read">Read</div>
    <div class="tab" data-tab="library">Library</div>
    <div class="tab" data-tab="about">About</div>
  </div>

  <section id="read" class="section show">
    <div class="card">
      <div class="row">
        <input id="intent" placeholder="One clear intention (present tense)…">
        <button id="saveIntent">Save</button>
        <button id="clear">Clear</button>
      </div>
      <p class="small">Tip: keep it simple (e.g., “I am calm and focused in class”).</p>
    </div>

    <div class="card">
      <div class="row" style="justify-content:space-between">
        <h3 style="margin:.2rem 0">Daily Card</h3>
        <div class="row"><button id="newDaily">New Daily</button></div>
      </div>
      <div id="daily" class="grid" style="cursor:pointer"></div>
      <p id="dailyMeta" class="small"></p>
    </div>

    <div class="card" id="drawBox">
      <h3 style="margin:.2rem 0">Draw</h3>
      <div class="row">
        <button id="draw1">Draw 1</button>
        <button id="drawMBS">Mind • Body • Spirit</button>
        <button id="drawOAO">Obstacle → Action → Outcome</button>
        <button id="shareBtn">Share</button>
      </div>
      <div id="board" class="grid" style="margin-top:8px"></div>
      <div id="coach" class="card" style="display:none"></div>
    </div>

    <div class="card">
      <h3 style="margin:.2rem 0">Recent</h3>
      <ul id="history" class="history"></ul>
    </div>
  </section>

  <section id="library" class="section">
    <div class="card">
      <h3 style="margin:.2rem 0">Deck Library (tap to study)</h3>
      <div id="libGrid" class="grid"></div>
    </div>
  </section>

  <section id="about" class="section">
    <div class="card">
      <h3>Technology for the Soul</h3>
      <p class="small">Use intention + attention + action. In M•B•S, the middle card (Body) = your next tiny action. In O→A→O, follow the Action card.</p>
      <p class="small">Images: Rider–Waite–Smith (public domain via Wikimedia Commons).</p>
    </div>
  </section>
</div>

<!-- Study Modal -->
<div id="studyBack" class="modalBack" role="dialog" aria-modal="true">
  <div class="modal">
    <div>
      <div id="imgWrap" class="skel"><img id="studyImg" class="bigimg" alt="" style="display:none"></div>
      <div class="row" style="justify-content:space-between;margin-top:6px">
        <span><span id="upr" class="flag">Upright</span><span id="rev" class="flag" style="display:none">Reversed</span></span>
        <span class="row"><button id="prev">← Prev</button><button id="next">Next →</button></span>
      </div>
    </div>
    <div>
      <h3 id="studyName" style="margin:0 0 6px"></h3>
      <p id="studyMean" class="small"></p>
      <textarea id="notes" placeholder="Your notes…" style="height:110px"></textarea>
      <div class="row" style="margin-top:6px"><button id="saveNote">Save</button><button id="clearNote">Clear</button><button id="flip">Flip</button><button id="close">Close</button></div>
    </div>
  </div>
</div>

<script>
const $=s=>document.querySelector(s),hdr=$("#hdr"),board=$("#board"),hist=$("#history"),lib=$("#libGrid");
const commons=f=>"https://commons.wikimedia.org/wiki/Special:FilePath/"+encodeURIComponent(f);
const FACE={"11":"Page","12":"Knight","13":"Queen","14":"King"},RANKN={'01':'Ace','02':'Two','03':'Three','04':'Four','05':'Five','06':'Six','07':'Seven','08':'Eight','09':'Nine','10':'Ten'},rankName=n=>RANKN[n]||n;
const MAJOR=["Fool","Magician","High Priestess","Empress","Emperor","Hierophant","Lovers","Chariot","Strength","Hermit","Wheel of Fortune","Justice","Hanged Man","Death","Temperance","Devil","Tower","Star","Moon","Sun","Judgement","World"];
const SUITS=["Cups","Pentacles","Swords","Wands"],RANKS=["01","02","03","04","05","06","07","08","09","10","11","12","13","14"];
const CARDS=(()=>{const a=[];MAJOR.forEach((n,i)=>a.push({code:`M${i}`,name:n,major:1,idx:i,img:commons(`RWS1909 - ${String(i).padStart(2,'0')} ${n}.jpeg`)}));SUITS.forEach(s=>RANKS.forEach(nn=>{const rank=FACE[nn]||rankName(nn);a.push({code:`${s}${nn}`,name:`${rank} of ${s}`,major:0,suit:s,nn,img:commons(`RWS1909 - ${s} ${nn}.jpeg`)})}));return a})();
const MEAN_MAJ={"Fool":"new start • leap","Magician":"focus • will","High Priestess":"intuition • inner voice","Empress":"abundance • nurture","Emperor":"structure • boundaries","Hierophant":"tradition • values","Lovers":"choice • alignment","Chariot":"discipline • victory","Strength":"gentle courage • patience","Hermit":"solitude • wisdom","Wheel of Fortune":"cycles • change","Justice":"truth • fairness","Hanged Man":"surrender • new view","Death":"release • rebirth","Temperance":"balance • integrate","Devil":"attachment • freedom","Tower":"shake-up • rebuild","Star":"hope • renewal","Moon":"uncertainty • discern","Sun":"joy • vitality","Judgement":"calling • forgiveness","World":"completion • mastery"};
const MEAN_SUIT={Wands:"action/creativity",Cups:"emotion/relationships",Swords:"mind/decisions",Pentacles:"work/body/money"};
const MEAN_RANK={Ace:"seed/new",Two:"choices",Three:"growth/team",Four:"stability",Five:"challenge",Six:"harmony/help",Seven:"assessment",Eight:"practice",Nine:"resilience",Ten:"culmination",Page:"curiosity",Knight:"movement",Queen:"embody",King:"authority"};
function meaning(c){if(c.major)return MEAN_MAJ[MAJOR[c.idx]];const r=FACE[c.nn]?MEAN_RANK[FACE[c.nn]]:MEAN_RANK[rankName(c.nn)];return `${r} — ${MEAN_SUIT[c.suit]}`}
function micro(c){if(c.major){const n=MAJOR[c.idx],M={"Fool":"start messy (5m)","Magician":"tiny prototype","High Priestess":"journal 5m","Empress":"tidy/nurture space","Emperor":"write 3 steps","Hierophant":"ask a mentor","Lovers":"choose what aligns","Chariot":"20-min sprint","Strength":"pause-breathe","Hermit":"quiet think 10m","Wheel of Fortune":"say yes to a chance","Justice":"state one truth","Hanged Man":"reframe one thought","Death":"let go of one thing","Temperance":"blend two paths","Devil":"mute a distraction","Tower":"remove shaky piece","Star":"name a hope","Moon":"sleep on it","Sun":"do energizing thing","Judgement":"answer one call","World":"finish loose end"};return M[n]||"one aligned micro-step"};const s={Wands:"do 1 action",Cups:"send 1 caring msg",Swords:"decide 1 thing",Pentacles:"do 1 practical task"}[c.suit],r={'01':"begin",'02':"choose",'03':"ask help",'04':"stabilize",'05':"fix friction",'06':"offer/accept help",'07':"plan next",'08':"practice 10m",'09':"protect progress",'10':"close loop",'11':"learn 1 thing",'12':"move forward",'13':"nurture",'14':"direct"}[c.nn];return `${s}; ${r}.`;}
function shuffle(a){a=[...a];for(let i=a.length-1;i>0;i--){const r=new Uint32Array(1);crypto.getRandomValues(r);const j=r[0]%(i+1);[a[i],a[j]]=[a[j],a[i]]}return a}
let st=JSON.parse(localStorage.getItem('qt_lite')||'null');if(!st){st={intent:'',history:[],journal:[],notes:{},daily:{date:'',card:'',ts:0}}}
const save=()=>localStorage.setItem('qt_lite',JSON.stringify(st));
document.querySelectorAll('.tab').forEach(t=>t.onclick=()=>{document.querySelectorAll('.tab').forEach(x=>x.classList.remove('active'));t.classList.add('active');document.querySelectorAll('.section').forEach(s=>s.classList.remove('show'));document.getElementById(t.dataset.tab).classList.add('show')});
$("#intent").value=st.intent||'';$("#saveIntent").onclick=()=>{st.intent=$("#intent").value.trim();save();hdr.textContent="Intent saved"};$("#clear").onclick=()=>{board.innerHTML='';hdr.textContent="Cleared"};
function today(){return new Date().toISOString().slice(0,10)}
function pickDaily(force){const d=today();if(force||st.daily.date!==d||!st.daily.card){const c=shuffle(CARDS)[0];st.daily={date:d,card:c.name,ts:Date.now()};save()}}
function renderDaily(){const c=CARDS.find(x=>x.name===st.daily.card)||shuffle(CARDS)[0];const t=document.createElement('div');t.className='tile';t.innerHTML=`<div class="skel"></div><img src="${c.img}" alt="${c.name}" style="display:none" onload="this.style.display='block';this.previousElementSibling.remove()"><b>${c.name}</b><div class="small">${meaning(c)}</div>`;const box=$("#daily");box.innerHTML='';box.appendChild(t);$("#dailyMeta").textContent="Tip: tap card for a tiny action.";box.onclick=()=>alert(micro(c))}
$("#newDaily").onclick=()=>{pickDaily(true);renderDaily()};pickDaily(false);renderDaily();
function record(picks){const rec={id:Date.now().toString(36),time:new Date().toLocaleString(),cards:picks.map(x=>x.name),intent:st.intent||''};st.history.unshift(rec);save();renderHistory()}
function renderHistory(){hist.innerHTML=(st.history||[]).slice(0,15).map(h=>`<li>${h.time} — ${h.cards.join(' | ')} ${h.intent?`— “${h.intent}”`:''}</li>`).join('')}
function say(text){const c=$("#coach");c.style.display='block';c.textContent=text}
function draw(n,labels,coachFn){board.innerHTML='';const picks=shuffle(CARDS).slice(0,n);picks.forEach((c,i)=>{const d=document.createElement('div');d.className='tile';d.innerHTML=`<div class="skel"></div><img src="${c.img}" alt="${c.name}" style="display:none" onload="this.style.display='block';this.previousElementSibling.remove()"><b>${labels?labels[i]:'Card '+(i+1)}</b><div>${c.name}</div><div class="small">${meaning(c)}</div>`;board.appendChild(d)});const coach=coachFn?coachFn(picks):(n===3?`Middle card suggests: ${micro(picks[1])}`:`Try this: ${micro(picks[0])}`);say(coach);record(picks)}
$("#draw1").onclick=()=>draw(1,null,p=>`Focus on this: ${micro(p[0])}`);
$("#drawMBS").onclick=()=>draw(3,["Mind","Body","Spirit"],p=>`Mind→Body→Spirit — act from Body: ${micro(p[1])}`);
$("#drawOAO").onclick=()=>draw(3,["Obstacle","Action","Outcome"],p=>`Obstacle→Action→Outcome — do: ${micro(p[1])}`);
$("#shareBtn").onclick=async()=>{if(!st.history.length)return alert("Do a reading first");const last=st.history[0];const q=new URLSearchParams();if(st.intent)q.set('intent',st.intent);q.set('cards',last.cards.join('||'));const url=location.origin+location.pathname+'?'+q.toString();const text=`Tarot
