;; 9. **Test 9**: Create a recursive function using `br_if` that conditionally branches to an `unreachable`, ensuring recursive stack calls pop and push operands correctly. Vary the recursion depth to test the correct stack state unwinding before ever reaching `unreachable`.

(assert_invalid
  (module
    (func $recursive-br_if (param $n i32) (result i32)
      (block $label
        (i32.const 0)
        (get_local $n)
        (i32.eqz)
        (br_if $label)
        (get_local $n)
        (i32.const 1)
        (i32.sub)
        (call $recursive-br_if)
      )
      (unreachable)
    )
  )
)