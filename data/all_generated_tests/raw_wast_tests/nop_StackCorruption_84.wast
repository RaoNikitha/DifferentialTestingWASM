;; 5. Using a sequence of `nop` instructions directly after a label in a branching scenario (e.g., `br` or `block`) to confirm that stack and control flow integrity is maintained across branches.

(assert_invalid
  (module
    (func $label-nop (block $label (nop) (nop) (br $label) (nop)))
  )
  "type mismatch"
)