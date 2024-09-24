;; 4. Embed a call instruction within a `br` (break) instruction that attempts to break to a block with incompatible return types.

(assert_invalid
  (module
    (func $nested-call-in-br
      (block (br 0 (call 1 (i32.const 0))))
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)