�����ļ����е�m�ļ��������Լ���д��rs�����m�������ڵ�Ŀ¼��
Ȼ��ִ��RsCodingUnitTest.m���ɡ���ȷ�Ĵ��뽫�����������Ϣ��

Begin unit test of RS co-/de-code and related modular, result will be reported at the end
+++++++++++++++++ [PASSED] Symbol Add modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Symbol Sub modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Symbol Mul modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Symbol Div modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Symbol Rev modular test ++++++++++++++++++


+++++++++++++++++ [PASSED] Poly Add modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Poly Sub modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Poly Mul modular test ++++++++++++++++++


+++++++++++++++++ [PASSED] RS encode modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Syndrome Calculation modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Error Position Poly Calculation modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Sigma during iteration  test ++++++++++++++++++
+++++++++++++++++ [PASSED] Root of Error Position Poly Calculation modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Error Value Calculation modular test ++++++++++++++++++
+++++++++++++++++ [PASSED] Error Position Calculation modular test ++++++++++++++++++

[Unit Test Report] Conduct 13 unit tests, 15 succeeded, 0 failed.

��������������룬��ô��ϲ�㣬���Ѿ�˳��ͨ����!
�������0 failed�������ӡ��δͨ������ģ�飬�벻Ҫ���ģ��ٽ�����!

�����Ҫע������⣺

1. ����ʽ��ϵ����������˳�����У�

2. ��Ϣ�������������еı�ʾ���ö���ʽ���������У�

3. [ErrorPosPolyCalc, SigmaCalc] = RsDecodeIterate(SyndromCalc) �����У�ErrorPosPolyCalc�Ǵ���λ�ö���ʽϵ����SigmaCalc�Ǵ���λ�ö���ʽϵ����ÿһ�����������Ϊ(2t+1)X(t+1)�ľ���

4. [RootCalc] = RsDecodeRoot(ErrPosPolyCalc) �����У�RootCalc��ʮ��������С�������У�

5. [ErrorValueCalc, ErrorPositionCalc] = RsDecodeForney(SyndromCalc, ErrPosPolyCalc, RootCalc) �����У�ErrorPositionCalcȡֵΪ0~14����С�������У�ErrorValueCalc��˳����ErrorPositionCalc���Ӧ��

6. ����������ȫ�棬�����Լ��ٲ��Լ������ݣ�����ע�����������Ĵ��������Ϊ�㡢����������û�д���ȡ�
