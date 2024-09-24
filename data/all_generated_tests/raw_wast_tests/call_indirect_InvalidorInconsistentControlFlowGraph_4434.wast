;; Create a sequence where an indirect call is made, and based on the result, there are multiple conditional branches leading to further indirect calls in a series. This checks the implementation's handling of complex branching and ensures all paths are correctly mapped.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (type (func (param i32)))
    (table 0 funcref)
    (func $complex-branch-test
      (local i32)
      (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
      (local.set 0)
      (local.get 0)
      (i32.const 0)
      (i32.eq)
      (if (then
          (i32.const 1)
          (call_indirect (type 1) (i32.const 1) (i32.const 1))
          (drop)
        ) (else
          (i32.const 2)
          (call_indirect (type 2) (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)