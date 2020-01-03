//
//  AddBoldTagTests.swift
//  DataStructureTests
//
//  Created by Đinh Văn Nhật on 2020/01/03.
//  Copyright © 2020 Đinh Văn Nhật. All rights reserved.
//

import XCTest
@testable import DataStructure

class AddBoldTagTests: XCTestCase {
    func test1() {
        XCTAssertEqual(AddBoldTag().addBoldTag("abcxyz123", ["abc", "123"]), "<b>abc</b>xyz<b>123</b>")
    }

    func test2() {
        XCTAssertEqual(AddBoldTag().addBoldTag("aaabbcc", ["aaa", "aab", "bc"]), "<b>aaabbc</b>c")
    }

    func test3() {
        XCTAssertEqual(AddBoldTag().addBoldTag("xhhjzbkvpmasiypsqqjobufcqmlhdjffrdohsxgksftaekzhwzydhbfdiylihnvjlvpoptnqigszckimljbepgisnmyszfsxkxyfdfqngytfuihepohapvhbyhqydvroflfnsyjmygtykdejfudrhxxawcewgiguiwsvqrgbxrbdnrvguzjftqcsjbvjlbxfsvzpdpmtlzobwnxrtgisbcqmhugncjwgatfctydryakvbnmlbiftndfefylsmlebzdumefuflwhtwijtrhhhmknklalgqjaoicmnywtvzldbeftkydjsdkkonayhdxhrjazosqloilagcwzeezavnsqelxqhtlzymedxmkrovxhkrgfenyhxgdroeejedbwpnkqbqknalwgxoxweyxngorvrpnfkvagdqkbtuayaihyhwcsdtjzzvxfavrhzgf", ["xh","hj","zb","kv","pm","as","iy","ps","qq","jo","bu","fc","qm","lh","dj","ff","rd","oh","sx","gk","sf","ta","ek","zh","wz","yd","hb","fd","li","hn","vj","lv","po","pt","nq","ig","sz","ck","im","lj","be","pg","is","nm","ys","zf","kx"]), "<b>xhhjzbkvpmasiypsqqjobufcqmlhdjffrdohsxgksftaekzhwzydhbfdiylihnvjlvpoptnqigszckimljbepgisnmyszfsxkx</b>y<b>fd</b>fqngytfuihe<b>poh</b>apv<b>hb</b>yhq<b>yd</b>vroflfnsyjmygtykdejfudrhxxawcewg<b>ig</b>uiwsvqrgbxrbdnrvguzjftqcsjb<b>vj</b>lbxfsvzpd<b>pm</b>tlzobwnxrtg<b>is</b>bc<b>qm</b>hugncjwgat<b>fc</b>t<b>yd</b>rya<b>kv</b>b<b>nm</b>lbiftndfefylsmlebzdumefuflwhtwijtrhhhmknklalgqjaoicmnywtvzld<b>be</b>ftk<b>ydj</b>sdkkonayhd<b>xh</b>rjazosqloilagc<b>wz</b>eezavnsqelxqhtlzymedxmkrov<b>xh</b>krgfenyhxgdroeejedbwpnkqbqknalwgxoxweyxngorvrpnf<b>kv</b>agdqkbtuayaihyhwcsdtjzzvxfavrhzgf")
    }
}
