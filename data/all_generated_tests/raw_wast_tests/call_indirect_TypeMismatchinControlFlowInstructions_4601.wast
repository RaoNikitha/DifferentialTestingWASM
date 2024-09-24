;; 10. Create a `call_indirect` instruction within a branching control structure, such as a `select` statement, with one branch leading to a function type mismatch and the other branch correct. This will verify type consistency and dynamic function resolution in selective control flows.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param f64)))
    (func $f1 (param i32))
    (func $f2 (param f64))
    (table funcref (elem $f1 $f2))
    (func $branching-call-indirect
      (i32.const 1)
      (select
        (call_indirect (type 0) (i32.const 0) (i32.const 0))
        (call_indirect (type 1) (i32.const 1) (i32.const 0))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)