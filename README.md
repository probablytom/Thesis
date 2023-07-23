Repo for PhD thesis.

## Current state

### By chapter

While technically `Draft 1 complete` should be marked before something's ready
to review, once something's content complete I don't think there's a reason
_not_ to review it; just might still shift a little on my end.

- Introduction
  - [ ] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- Lit review
  - [X] Content decided
  - [X] Content complete
  - [X] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- Prior work
  - [X] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- PDSF rewrite
  - [X] Content decided
  - [X] Content complete
  - [X] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- RPGLite
  - [X] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- Optimising experiments with aspects
  - [X] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- Applying realistic aspects to changed models
  - [X] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- Future work
  - [ ] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
- Closing discussion
  - [ ] Content decided
  - [ ] Content complete
  - [ ] Draft 1 complete
  - [ ] Reviewed
  - [ ] Draft 2 complete
  
### Other work to do

- [ ] General copy editing 🫡 (consistency in voice, hyphenation, US vs UK english, etc)


## Plan

Gantt chart for planning PhD:

```mermaid
gantt
    title Tom Wallis — PhD Completion Plan
    dateFormat  MM-DD
    axisFormat %d %B
    todayMarker on
    tickInterval 1month
    
    
    section Content Drafting
    Re-Review Papers           :w1, 01-27, active, 14d
    Redraft Lit Review     : litReviewFinalDraft, after w1 , 14d
    Prior Work working draft : priorWorkStart, after litReviewFinalDraft, 14d
    Prior Work cleanup & final Draft :priorFinish , after priorWorkStart, 14d 
    Contextual work & lit-focused writing draft complete : milestone, after priorFinish
    
    
    Draft final sections of tools chapter      : toolsStart, after litReviewFinalDraft, 21d
    Tools final draft      :toolsFinish, after priorFinish, 7d
    RPGLite Sim Technical background redraft :rpgLiteTechnicalNotes, after toolsFinish, 14d
    Tooling & Technical writing draft complete : milestone, after rpgLiteTechnicalNotes

    RPGLite Experimental Explanation :rpgLiteDiscussion1, after rpgLiteTechnicalNotes, 14d
    RPGLite RQ redux & explanation of experiments :rpgLiteDiscussion2, after rpgLiteDiscussion1, 7d
    RPGLite Experimental Findings 1 :rpgLiteExp2, after rpgLiteDiscussion2, 14d
    RPGLite Experimental Findings 2 :rpgLiteExp3, after rpgLiteExp2, 14d
    Experimental Results draft complete : milestone, after rpgLiteExp3

    Experimental Outcome discussion :discussion, after rpgLiteExp3, 14d
    Conclusion & Intro draft :concAndIntro, after discussion, 14d

    Add future work ideas to construct skeleton & basic concepts :futureWorkScratching, after w1, 112d
    Future work notes restructuring into chapter draft :after futureWorkScratching, 28d

    Complete draft : milestone, after concAndIntro
    
    section Planning
    Agree contents, scope & skeleton of prior work chapter :p1, 02-17, 1d
    Agree basic skeleton of prior work chapter :03-03, 1d
    Check-in 1 on Future Work. Too big? Too small? Ideas missing? :03-17, 1d
    Agree skeleton structure for RPGLite Experimental Chapter 1 :03-31, 1d
    Agree skeleton for RPGLite Experimental Chapter 2 :04-14, 1d
    Agree skeleton structure & points of discussion :04-28, 1d
    Check-in 2 on Future Work. Too big? Too Small? Ideas missing? : 05-12, 1d
    Skeleton Conclusion & Introduction complete :pn, 05-12, 1d
    Planning complete : milestone, after pn, 1d

    section Copyediting
    Light edit lit-focused writing : copyEditLit, after rpgLiteTechnicalNotes, 14d
    Light edit tooling & software writing : copyEditTooling, after rpgLiteExp3, 14d
    Full edit experimental writing : copyEditExperimentalWriting, after concAndIntro, 14d
    Full edit discussion, conclusion, intro : copyEditBookends, after copyEditExperimentalWriting, 14d
    Final editing passthrough : copyEditingFinal, after copyEditBookends, 14d
    Thesis complete : milestone, after copyEditingFinal

    section Accountability & Support
    Checkin 1 with grad school on progress : milestone, a1, 03-03, 1d
    Checkin 2 with grad school on progress : milestone, a2, after a1, 8w
    Checkin 3 with grad school on progress : milestone, a3, after a2, 8w
    Checkin 4 with grad school on progress : milestone, a4, after a3, 8w
    Receive edit suggestions from Tim on lit-focused writing : milestone, after rpgLiteTechnicalNotes,
    Receive edit suggestions from Tim on tooling-focused writing : milestone, after rpgLiteExp3,
    Receive edit suggestions from Tim on experimental-focused writing : milestone, after concAndIntro,
    Receive edit suggestions from Tim on discussion / intro / conclusion / future work : milestone, after copyEditExperimentalWriting,
    Final editing notes from Tim : milestone, after copyEditBookends, 
```