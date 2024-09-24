;; Test 10: Implement a function that calls another function based on a series of chained conditions (`br_if` sequences). Validate whether these condition chains are evaluated correctly, leading to the appropriate function calls and consistent behavior between implementations.

(assert_invalid
  (module
    (type (func))
    (func $condition-chain 
      (local i32)
      i32.const 0
      set_local 0
      block
        block
          get_local 0
          i32.const 1
          i32.eq
          br_if 0
          call 0
        end
        get_local 0
        i32.const 2
        i32.eq
        br_if 0
        call 0
      end
    )
  )
  "unknown function"
)