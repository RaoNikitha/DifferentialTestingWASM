;; Test 3: Create a scenario where `call_indirect` is used within a nested loop structure. The inner loop has an exit condition dependent on the successful execution of the indirect call. Verify if a signature mismatch causes the inner loop to continue indefinitely, affecting the outer loop’s termination.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $sig_mismatch (func (param i32) (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (param i32) (result i32) (i32.add (local.get 0) (local.get 0)))
    (func (result i32)
      (local i32 i32)
      (loop $outer
        (local.set 0 (i32.const 10))
        (block $break_outer
          (loop $inner
            (br_if $break_outer
              (i32.eq
                (local.tee 1
                  (call_indirect (type $sig_mismatch) (i32.const 0) (local.get 0))
                )
                (i32.const 0)
              )
            )
            (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
            (br_if $inner (i32.ne (local.get 0) (i32.const 0)))
          )
        )
      )
      (local.get 1)
    )
  )
  "type mismatch"
)