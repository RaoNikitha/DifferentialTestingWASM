;; 5. Implement a recursive function that is exported from one module and imported into another. Use `nop` to annotate each recursive `call`. This will test whether the `nop` instructions are appropriately ignored in a scenario where control flow and stack state must be preserved across module boundaries with recursion.

 ;; (module
  (func $recursive (export "recursive") (param $n i32) (result i32)
    (if (result i32) (i32.eq (local.get $n) (i32.const 0))
      (then (i32.const 0))
      (else (nop) (call $recursive (i32.sub (local.get $n) (i32.const 1))))
    )
  )
)

(module
  (import "env" "recursive" (func $recursive (param i32) (result i32)))
  (func (export "test") (result i32)
    (call $recursive (i32.const 5))
  )
)