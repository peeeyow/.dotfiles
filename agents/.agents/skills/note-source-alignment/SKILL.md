---
name: note-source-alignment
description: Review whether a user's notes, summary, study guide, or claimed takeaways accurately reflect an original source. Use whenever the user asks to compare notes against a source, verify a summary or paraphrase, check whether annotations are supported, identify claims missing from a source, or find contradictions between notes and a linked, pasted, or uploaded original. Produce claim-level evidence and repairs; do not substitute general fact-checking or research beyond the supplied source.
compatibility: Requires access to the source as pasted text, a local file, or a fetchable URL.
---

# Note–Source Alignment Review

Compare the notes only with the source the user supplies. The goal is faithful representation, not whether either text is true in the wider world.

## Inputs

Obtain both:

- **Source:** pasted text, local document, or URL.
- **Notes:** pasted text or local document.

If either is missing, ask for it. For a URL, fetch the page; for a local file, read it. If a PDF or image cannot be read reliably, say which pages or passages are unavailable instead of guessing. Do not research other sources unless the user explicitly asks.

## Method

1. Identify the source's scope, author, date/version, and stated limits when available.
2. Split the notes into independently checkable claims. Keep a note intact only when its parts cannot be separated without changing its meaning.
3. Locate the closest source passage for every claim. A claim is supported only when the source actually entails it in context.
4. Check qualifiers carefully: who/what is covered, time period, certainty, quantities, causality, comparison, and whether a source reports a view rather than endorses it.
5. Label every claim:
   - **Aligned** — faithful paraphrase or direct restatement.
   - **Qualified** — broadly supported, but omits or changes a material condition, uncertainty, or scope.
   - **Unsupported** — no adequate basis in the supplied source.
   - **Contradicted** — the source says the opposite or materially conflicts.
   - **Uncheckable** — the needed part of the source is unavailable or too ambiguous.

Treat a reasonable inference as an inference, not as a direct statement. Do not mark a claim aligned merely because it is generally true or plausible.

## Report

Start with a one-sentence verdict and counts by label. Then use this table:

| # | Note claim | Status | Source evidence | What to change |
|---|---|---|---|---|

- Quote the smallest decisive passage. Cite a page number, section heading, paragraph, or URL fragment when available.
- For **Aligned**, write `No change needed` in the final column.
- For **Qualified**, **Unsupported**, or **Contradicted**, provide a minimal replacement that is faithful to the source.
- For **Uncheckable**, name the missing page, section, or extraction problem and say what would resolve it.

Finish with **Missing context**, listing only source details that materially change the notes' interpretation. Keep the review claim-focused; do not rewrite all notes unless asked.
