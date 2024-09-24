;; 5. Implement a `call_indirect` usage where the function’s body contains a branch instruction erroneously targeting a loop label defined outside its context. This verifies the correct trapping mechanism in both OCaml and Java implementations.

(assert_invalid
  (module
    (type (func))
    (type $sig (func))
    (table 1 funcref)
    (func $f (type $sig)
      (loop $loop
        (block $blk
          (br $loop)
        )
      )
    )
    (elem (i32.const 0) $f)
    (func $test
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "invalid branch target"
)