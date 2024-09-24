;; 9. **Test Description**: Develop a module with incorrect mutual recursion, leading to calling an `unreachable` instruction in specific recursion depth, testing for correct stack unwinding.

(assert_invalid
  (module
    (func $mutual-recursion-f1 (call $mutual-recursion-f2))
    (func $mutual-recursion-f2 (unreachable) (call $mutual-recursion-f1))
  )
  "unreachable executed"
)