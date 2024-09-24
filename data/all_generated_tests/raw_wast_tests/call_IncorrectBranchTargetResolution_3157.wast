;; Test 6: Write a WASM script where a function performs a tail-recursive call containing branching instructions. Alter case inputs to show incorrect behavior where the tail recursion's branch targets fail to resolve correctly or point to an invalid destination.

(assert_invalid
  (module
    (func $test-func (param i32) (result i32)
      (local i32)
      (block $exit
        (br_if $exit (i32.eqz (local.get 0)))
        (local.set 1 (i32.sub (local.get 0) (i32.const 1)))
        (br $exit)
        (call $test-func (local.get 1))
      )
    )
  )
  "type mismatch"
)