public class App {
    public static void usedMember1()
    {
        Member m1 = new Member("홍길동", "의적");

        System.out.println(m1.getName());
        System.out.println(m1.getNickname());
    }

    public static void usedMember2(Member member)
    {
        Member m1 = member;

        System.out.println(m1.getName());
        System.out.println(m1.getNickname());
    }
    
    // 프레임워크가 의존성(반드시 필요한 것들)을 메인함수에 넣어준다. 
    public static void main(String[] args) throws Exception {
        // usedMember1()와 이 함수 안에서 사용하는 객체 등등은
        // 메인함수와 독립적으로 존재한다.
        // 메인함수에서 컨트롤 할수 있는게 없다.
        usedMember1();

        // usedMember2()는 외부에서 이 함수가 사용하는 객체를 파라미터로 넘긴다.
        // 따라서 usedMember2()는 메인함수에서 관리 되어질 수 있다.

        // 의존성 주입
        Member mem = new Member("홍길동", "의적");
        usedMember2(mem);


    }
}
