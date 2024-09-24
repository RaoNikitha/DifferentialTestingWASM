;; 8. Use a `nop` inside a catch block of a `try-catch` structure, which captures an exception and then executes an `unreachable`. Confirm the exception handling and ensure `unreachable` is triggered appropriately.

(assert_invalid
  (module
    (func (try (catch (nop) (unreachable))))
  )
  "unreachable executed after nop in catch block"
)