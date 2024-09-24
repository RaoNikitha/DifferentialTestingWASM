;; 9. Create a scenario where a function exported from one module, containing `unreachable` instructions separated by `nop`, is called by another module within a try-catch block. This tests if `nop` instructions do not interfere with the proper trapping behavior and exception handling across module boundaries.

 ;; (module
  (func $exported (export "exported")
    (nop)
    (nop)
    (unreachable)
    (nop)
    (unreachable))
)
(module
  (import "js" "print" (func $print))
  (import "./module" "exported" (func $exported))
  (func (export "test")
    (try
      (do
        (call $exported)
      )
      (catch_all
        (call $print)
      )
    )
  )
)