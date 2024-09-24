;; Test a block containing a sequence of instructions where a `block` wraps a `call` to a function that has another `call_indirect` inside it, followed by a `br` (branch) instruction. This checks how well each implementation manages control flow connection between these nested calls and blocks when jumping out of the inner block.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $f (param i32) (result i32)
      (call_indirect (type $t) (i32.const 0) (local.get 0))
    )
    (func (result i32)
      (block (result i32)
        (call $f (i32.const 42))
        (br 0)
      )
    )
  )
  "type mismatch"
)