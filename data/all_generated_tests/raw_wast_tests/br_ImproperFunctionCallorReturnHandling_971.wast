;; 2. **Indirect Function Call with Excessive Arguments:**    - Use a `call_indirect` instruction within a `block` and provide more arguments than required by any function within the type table, followed by a `br` instruction. Test whether the branch handles excess arguments correctly and maintains proper execution flow.

(assert_invalid
  (module
    (func $indirect-call-excess-args
      (type $t (func (param i32)))
      (table anyfunc (elem $fn))
      (func $fn (param i32))
      (block
        (i32.const 0)
        (i32.const 1)
        (i32.const 2)
        (call_indirect (type $t) (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)