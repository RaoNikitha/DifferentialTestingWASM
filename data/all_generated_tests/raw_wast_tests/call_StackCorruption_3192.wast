;; Test Description 1: Invoke a function with no arguments and no return value, ensuring that the stack pointer remains unchanged before and after the `call` instruction. Check if either implementation corrupts the stack by altering the stack pointer.

(assert_invalid
  (module
    (func $no-arg-no-ret (call 1))
    (func)
  )
  "unknown function"
)