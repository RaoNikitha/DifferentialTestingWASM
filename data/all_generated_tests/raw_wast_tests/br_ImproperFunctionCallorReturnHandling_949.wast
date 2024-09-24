;; 10. Create a sequence of `block` and `loop` having `call_indirect`, followed by improper `br` targeting to an outermost block. This differential test should highlight discrepancies in how the improperly referenced label influences function calls and returns.

(assert_invalid
  (module
    (type $functype (func))
    (import "" "" (table 1 anyfunc))
    (func $type-call-indirect-br
      (block
        (block
          (block (br 2) (unreachable))
          (call_indirect (type $functype) (i32.const 0))
        )
        (loop (br 1))
      )
    )
  )
  "unknown label"
)