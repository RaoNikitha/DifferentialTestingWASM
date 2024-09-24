;; 5. Construct a function that indirectly calls another function via `call_indirect` after dynamically choosing an index. Introduce a branching error such that an early 'br' jumps to an unintended label, thus making the indirect call resolve to an incorrect function type.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) func $f)
    (func $f (param i32) (local.get 0))
    (func (param i32)
      (block
        (br 0)
        (call_indirect (type $sig2) (local.get 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)