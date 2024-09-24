;; 7. **Cross-Block Label Misinterpretation Test:**    - Add an `unreachable` within the last statement of a block, preceding a `br` instruction targeted to an outer block. Validate if encountering `unreachable` results in an immediate trap preventing any invalid branch resolution.

(assert_invalid
  (module
    (block
      (block (br 1) (unreachable))
    )
  )
  "unreachable"
)