;; 1. **Test Case 1: Function Call Followed by Unreachable Trap**    - **Description:** Create two modules, Module A and Module B. Module A imports a function from Module B and calls it. In Module B, the function immediately executes `unreachable`. This tests if the stack remains consistent and a trap is triggered correctly when crossing module boundaries.

(assert_invalid
  (module
    (import "moduleB" "funcB" (func $funcB))
    (func $type-unreachable-trap-cross-module
      (call $funcB)
      (unreachable)
    )
  )
  "unreachable trap executed"
)