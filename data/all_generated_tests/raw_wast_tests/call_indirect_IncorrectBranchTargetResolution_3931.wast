;; 10. Indirectly call a function with a `call_indirect` instruction referencing a correctly indexed table but includes a branch targeting a global start label, which is incorrect. This difference checks if both implementations detect mismatched branching and trap as expected.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $func-1 (param i32) (nop))
    (elem (i32.const 0) $func-1)
    (start 0)
    (func $main
      (block $label
        (call_indirect (type 0) (i32.const 0))
        (br $label)
      )
    )
  )
  "branch target mismatch"
)