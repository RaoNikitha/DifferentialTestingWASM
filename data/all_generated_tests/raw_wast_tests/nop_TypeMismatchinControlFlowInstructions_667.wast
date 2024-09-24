;; Insert `nop` at strategic points within a `loop` that includes stack polymorphic instructions that expect continuation with specific types, ensuring the loop's invariant types get mismatched. Check if wizard_engine validation acknowledges it.

(assert_invalid
  (module
    (func (loop (nop) (i32.const 1) (br_if 0) (nop) (nop)))
  )
  "type mismatch"
)